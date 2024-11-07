using MyApp.ServiceModel;

namespace MyApp.ServiceInterface;

public class KamalUpService
{
    public object Get(KamalUp request)
    {
        return new KamalUpResponse();
    }
}