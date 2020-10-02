# certlm.msc (LocalMachine) certmgr.msc (CurrentUser)
Import-PfxCertificate -FilePath dev.pfx Cert:\LocalMachine\My -Password (ConvertTo-SecureString dev -asplaintext -force) -Exportable

# regedit.msc Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\SystemCertificates\Root\Certificates\
# system store locations https://docs.microsoft.com/en-us/windows/win32/seccrypto/system-store-locations
Import-Certificate -FilePath dev.crt -CertStoreLocation Cert:\CurrentUser\Root
