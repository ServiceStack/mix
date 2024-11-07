using ServiceStack;

namespace MyApp.ServiceModel;

[Route("/up")]
public class KamalUp : IGet, IReturn<KamalUpResponse>
{
}

public class KamalUpResponse
{

}