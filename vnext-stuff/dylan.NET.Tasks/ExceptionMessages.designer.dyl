namespace dylan.NET.Tasks

    class private static ExceptionMessages

        field private static System.Resources.ResourceManager resman

        method private static void ExceptionMessages()
            resman = new System.Resources.ResourceManager(gettype ExceptionMessages)
        end method

        property assembly static string NotBoolean
            get
                return resman::GetString("NotBoolean")
            end get
        end property

        property assembly static string IsCompletedNotFound
            get
                return resman::GetString("IsCompletedNotFound")
            end get
        end property

        property assembly static string GetResultNotFound
            get
                return resman::GetString("GetResultNotFound")
            end get
        end property

        property assembly static string OnCompletedNotFound
            get
                return resman::GetString("OnCompletedNotFound")
            end get
        end property

        property assembly static string GetAwaiterNotFound
            get
                return resman::GetString("GetAwaiterNotFound")
            end get
        end property

        property assembly static string NotTResult
            get
                return resman::GetString("NotTResult")
            end get
        end property

        property assembly static string RethrowingEx
            get
                return resman::GetString("RethrowingEx")
            end get
        end property

    end class

end namespace
