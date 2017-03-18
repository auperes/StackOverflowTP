package mystackoverflow


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class Feature
{
    private static Feature feature
    Map<String, Boolean> feat = new HashMap<String, Boolean>()

    private Feature()
    {

    }

    public static Feature getInstance()
    {
        if(feature == null)
        {
            feature = new Feature()
        }
        return feature
    }

    public static void setActivated(String featureName, Boolean activated)
    {
        getInstance().getFeat().put(featureName, activated)
    }

    public static Boolean isActivated(String featureName)
    {
        return getInstance().getFeat().get(featureName)
    }

    static constraints = {
    }
}