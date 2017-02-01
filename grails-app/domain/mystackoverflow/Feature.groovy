package mystackoverflow

class Feature {

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

    public static void AddToMap(String s, Boolean b)
    {
        getInstance().getFeat().put(s,b)
    }

    static constraints = {
    }
}
