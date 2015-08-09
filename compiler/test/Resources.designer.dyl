namespace test

	class private static Resources

		field private static System.Resources.ResourceManager resman

		method private static void Resources()
			resman = new System.Resources.ResourceManager(gettype Resources)
		end method

		property assembly static System.IO.Stream Code
			get
				return resman::GetStream("Code")
			end get
		end property

	end class

end namespace
