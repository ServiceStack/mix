using System;
using ServiceStack;

namespace MyApp.ServiceModel
{
    [Route("/mq/publish")]
    public class PublishMq : IReturnVoid
    {
        public string Name { get; set; }
        public int Add { get; set; }
    }

    [Route("/mq/test")]
    public class TestMq : IReturn<TestMqResponse>
    {
        public string Name { get; set; }
        public int Add { get; set; }
    }

    public class TestMqResponse
    {
        public string Name { get; set; }
        public long Counter { get; set; }
        public string StatsDescription { get; set; }
        public ResponseStatus ResponseStatus { get; set; }
    }
}
