#!/bin/bash

# Example use
# ./update-route-53.sh Z1234567890ABC example.web-templates.io

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 HOSTED_ZONE_ID RECORD_TO_UPDATE"
    echo "Example: $0 Z1234567890ABC example.web-templates.io"
    exit 1
fi

# Assign arguments to variables
HOSTED_ZONE_ID="$1"
RECORD_NAME="$2"
IP_ADDRESS="5.78.77.149"

# Validate HOSTED_ZONE_ID format (basic check)
if [[ ! $HOSTED_ZONE_ID =~ ^Z[A-Z0-9]+$ ]]; then
    echo "Error: Invalid hosted zone ID format. Should start with 'Z' followed by alphanumeric characters."
    exit 1
fi

# Validate record name format (basic check)
if [[ ! $RECORD_NAME =~ \.web-templates\.io\.?$ ]]; then
    echo "Error: Record name must end with .web-templates.io"
    exit 1
fi

# Ensure record name ends with a dot
if [[ ! $RECORD_NAME =~ \.$ ]]; then
    RECORD_NAME="${RECORD_NAME}."
fi

echo "Updating DNS record..."
echo "Hosted Zone ID: $HOSTED_ZONE_ID"
echo "Record Name: $RECORD_NAME"
echo "IP Address: $IP_ADDRESS"

# Create a JSON file for the change batch
cat > change-batch.json << EOF
{
    "Comment": "Update A record",
    "Changes": [
        {
            "Action": "UPSERT",
            "ResourceRecordSet": {
                "Name": "${RECORD_NAME}",
                "Type": "A",
                "TTL": 300,
                "ResourceRecords": [
                    {
                        "Value": "${IP_ADDRESS}"
                    }
                ]
            }
        }
    ]
}
EOF

# Execute the change
if aws route53 change-resource-record-sets \
    --hosted-zone-id ${HOSTED_ZONE_ID} \
    --change-batch file://change-batch.json; then
    echo "DNS record update successful"
else
    echo "Error: Failed to update DNS record"
    exit 1
fi

# Clean up
rm change-batch.json