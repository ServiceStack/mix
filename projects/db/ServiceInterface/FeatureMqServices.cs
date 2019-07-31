using System;
using ServiceStack;
using ServiceStack.Messaging;
using db.ServiceModel;

namespace db.ServiceInterface
{
    public class MqServices : Service
    {
        public IMessageService MqService { get; set; }

        public void Any(PublishMq request)
        {
            PublishMessage(request.ConvertTo<TestMq>());
        }

        public object Any(TestMq request)
        {
            if (!string.IsNullOrEmpty(request.Name))
                Cache.Set("mq.name", request.Name);
            
            if (request.Add > 0)
                Cache.Increment("mq.counter", (uint)request.Add);
            else if (request.Add < 0)
                Cache.Decrement("mq.counter", (uint)(request.Add * -1));

            return new TestMqResponse {
                Name = Cache.Get<string>("mq.name"),
                Counter = Cache.Get<long>("mq.counter"),
                StatsDescription = MqService.GetStatsDescription(),
            };
        }
    }
}
