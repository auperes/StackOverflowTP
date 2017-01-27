package mystackoverflow

enum Role
{
	ADMIN(0), USER(1)

	int authority

	Role(int value) {
		this.authority = value
	}
}
