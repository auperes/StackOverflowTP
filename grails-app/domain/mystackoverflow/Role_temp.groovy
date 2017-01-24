package mystackoverflow

class Role_temp
{
	String authority

	static constraints = {
		authority blank: false, unique: true
	}

	String toString()
	{
		return authority;
	}
}
