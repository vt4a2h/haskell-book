--simple_sum :: Int -> Int
--simple_sum value = value + value

--indicate :: String -> String
--indicate address
--    | address == "127.0.0.1" = "localhost"
--    | null address = "empty IP-address"
--    | otherwise = address

--prepare_length :: Double -> Double
--prepare_length line = 
--    line * coefficient
--    where coefficient = 0.4959

--prepare_length_let :: Double -> Double
--prepare_length_let line = 
--    let coefficient = 12.4959
--        correction = 0.0012
--    in
--    line * coefficient - correction

--main = 
--	print (f 5)
--	where f = \x -> x*x

--
-- higher-order functions
--

--type Login = String
--type Password = String
--type AvatarURL = String
--type UserId = Integer

--user_info :: Login -> Password -> AvatarURL -> UserId -> String
--user_info login password avatar_URL user_id =
--	"Fullinfo about user @" ++ (show user_id) ++ ":" ++
--	"\n login: " ++ login ++
--	"\n password: " ++ password ++
--	"\n avatar url: " ++ avatar_URL

--type EmptyInfo = Login -> Password -> AvatarURL -> UserId -> String
--type WithLogin = Password -> AvatarURL -> UserId -> String
--type AndWithPassword = AvatarURL ->UserId -> String
--type AndWithAvatarURL = UserId -> String

--store_login_in :: EmptyInfo -> UserId -> WithLogin
--store_login_in empty_info user_id = 
--	empty_info "vitaly"
--	-- get login operation depends on user_id

--store_password_in :: WithLogin -> UserId -> AndWithPassword
--store_password_in info_with_login user_id = 
--	info_with_login "123456789abc"
--	-- get password operation depends on user_id

--store_avatar_URL_in :: AndWithPassword -> UserId -> AndWithAvatarURL
--store_avatar_URL_in info_with_password user_id =
--	info_with_password "http://foo.bar.png/"
--	-- get url operation depends on user_id

--main = 
--	let user_id = 1234
--	    info_with_login = store_login_in user_info user_id
--	    info_with_password = store_password_in info_with_login user_id
--	    info_with_avatar_URL = store_avatar_URL_in info_with_password user_id
--	    full_info_about_user = info_with_avatar_URL user_id
--	in
--	putStrLn full_info_about_user

--
-- URL example
--

--import Data.Char
--import Data.String.Utils

--add_prefix :: String -> String
--add_prefix url = 
--	if startswith prefix url then url else prefix ++ url
--	where prefix = "http://"

--encode_all_spaces = \url -> replace " " "%20" url

--make_it_lower_case = \url -> map toLower url

--main =
--	putStrLn $ add_prefix $ encode_all_spaces $ make_it_lower_case url
--	where url = "www.SITE.com/test me/Start page"

--
-- list example
--

--this_is_a_wild_animal :: String -> Bool
--this_is_a_wild_animal name =
--	name `elem` wild_animals
--	where wild_animals = ["Bear", "Tiger", "Lion", "Wolf"]

--remove_all_empty_names_from :: [String] -> [String]
--remove_all_empty_names_from list_of_names = 
--	filter not_empty_name list_of_names
--	where not_empty_name = \name -> not $ null name

--main = 
--	print [2, 4 .. 30]

--
-- tuple
--

--import Data.Tuple.Select

--main  = print $ sel3 ("one", "two", "three", "four")

--
-- sly list =)
--

--import Data.Char

--main = print [toUpper c | c <- "http", c == 't', c /= 'h']

--main = 
--	print [prefix ++ name | name <- names, prefix <- name_prefix]
--	where names = ["James", "Victor", "Denis", "Michael"]
--	      name_prefix = ["Mr. "]

--main = 
--	print [if car == "Bently" then "Wow!" else "Good!" | car <- cars]
--	where cars = ["Mercedes",
--	              "BMW",
--	              "Bently",
--	              "Audi",
--	              "Bently"]

--import Data.String.Utils

--ends_with :: String -> String -> Bool
--ends_with str suffix = endswith suffix str

--check_googler_by :: String -> String
--check_googler_by email = 
--	if email `ends_with` "gmail.com"
--	then name_from email ++ " is a Googler!"
--	else email
--	where name_from = \full_email -> takeWhile (/= '@') full_email

--main = print [check_googler_by email | email <- ["adam@gmail.com",
--                                                 "bob@gmail.com",
--                                                 "richard@gmail.com",
--                                                 "elena@yandex.ru",
--                                                 "denis@gmail.com"]]

--
-- types
--

--data IP_address = IP String | Host String

--instance Show IP_address where
--	show (IP address) =
--	    address

--	show (Host address) =
--		if address == "127.0.0.1" then "localhost" else address

--data Transport_layer = TCP | UDP | SCTP | DCCP | SPX
--                       deriving (Show, Enum, Bounded)

--description_of :: Transport_layer -> String
--description_of protocol = 
--	case protocol of 
--	    TCP  -> "Transmission Control Protocol"
--	    UDP  -> "User Datagram Protocol"
--	    SCTP -> "Stream Control Transmission Protocol"
--	    DCCP -> "Datagram Congestion Control Protocol"
--	    SPX  -> "Sequenced Packet Exchange"

--main = print [description_of protocol | protocol <- [TCP ..]]

--
--composite types
--

--data User = User {
--                  first_name, 
--                  last_name,
--                  email :: String,
--                  account,
--                  uid :: Integer
--                  }

--change_email :: User -> String -> User
--change_email user new_email = user { email = new_email }

--main =
--	print $ first_name user ++ " "  ++
--	        last_name user  ++ ", " ++
--	        email user
--	where user = User { first_name = "Vitaly",
--	                    last_name  = "Fanaskov",
--	                    email      = "v@v.com" }

--
-- deriving
--

--data IP_address = IP String
--                  deriving Show

--data User = User {
--                  first_name, 
--                  last_name,
--                  year_of_brith,
--                  email :: String,
--                  account,
--                  uid :: Integer
--                  } deriving (Show, Read, Eq)

--main = 
--	let object = user
--	    serialized_object = show object
--	    deserialized_object = read serialized_object
--	in
--	    print $ object == deserialized_object
--	where user = User { first_name = "Vitaly",
--                        last_name  = "Fanaskov",
--                        year_of_brith = "11.11.1111",
--                        email = "v@v.com",
--                        account = 123456789,
--                        uid = 123
--                      }

--main = print $ "minimal Int value: " ++ show (minBound :: Int) ++
--               ", maximum Int value: " ++ show (maxBound :: Int)

--
-- user types
--

--type SHU = Integer -- SHU (Scoville Heat Units)

--class Pepper a_pepper where
--	simple :: a_pepper
--	color  :: a_pepper -> String
--	pungency :: a_pepper -> SHU
--	name :: a_pepper -> String

--data Poblano = Poblano String
--data TrinidadScorpion = TrinidadScorpion

--instance Pepper Poblano where
--	simple = Poblano "ancho"
--	color (Poblano name) = "green"
--	pungency (Poblano name) = 1500
--	name (Poblano name) = name

--instance Pepper TrinidadScorpion where
--	color TrinidadScorpion = "red"
--	pungency TrinidadScorpion = 855000

--pepper_info :: Pepper a_pepper => a_pepper -> String
--pepper_info a_pepper = 
--	show (pungency a_pepper) ++ ", " ++ color a_pepper

--main =
--	putStrLn $ name (simple :: Poblano)

--
-- not so pure function
--

--obtain_user_text :: String -> IO String
--obtain_user_text promt = do
--	putStrLn promt -- приглашение
--	getLine        -- получение данных

--main :: IO ()
--main = do
--	first_text  <- obtain_user_text "Enter your text, please: "
--	second_text <- obtain_user_text "One more, please: "
--	putStrLn $ "You said '" ++ first_text ++ "' and '" ++ second_text ++ "'"

--obtain_two_texts_from_user :: IO String
--obtain_two_texts_from_user = do
--    putStrLn "Enter your text, please: "
--    first_text <- getLine
--    putStrLn "One more, please: "
--    second_text <- getLine
--    return $ "'" ++ first_text ++ "' and '" ++ second_text ++ "'"
--    putStrLn "And third text, please: " -- мы всё ещё продолжаем наш диалог!
--    getLine

--main = obtain_two_texts_from_user

--
-- exceptions
--

--import Control.Exception

--try_to_open_file :: FilePath -> IO String
--try_to_open_file path = 
--	readFile path `catch` possible_errors -- handle possible_errors (readFile path)
--	where
--		possible_errors :: IOException -> IO String
--		possible_errors error = return $ show error

--main :: IO ()
--main = do
--	file_content <- try_to_open_file "/user/foo.c"
--	putStrLn file_content

--main :: IO ()
--main = do
--	result <- try $ readFile path :: IO (Either IOException String)
--	case result of
--		Left exception -> putStrLn $ "Fault: " ++ show exception
--		Right content  -> putStrLn content
--	where path = "/user/foo.c"

--main :: IO ()
--main = do
--	result <- try $ evaluate $ 2 `div` 0 :: IO (Either SomeException Integer)
--	case result of
--		Left exception -> putStrLn $ "Fault: " ++ show exception
--		Right value -> print value

--import Control.Exception
--import Data.String.Utils
--import Data.Typeable

--type Repo = String

--data InvalidRepository = InvalidRepository Repo
--                         deriving (Show, Typeable)

--instance Exception InvalidRepository

--extract_protocol :: String -> String
--extract_protocol path = 
--	if path `starts_with` "git" || path `starts_with` "ssh"
--	then takeWhile (/= ':') path
--	else throw $ InvalidRepository path -- not correct
--	where starts_with = \url prefix -> startswith prefix url

--main :: IO ()
--main = do
--    result <- try $ evaluate $ extract_protocol "ss://foo@bar/proj.git" :: IO (Either SomeException String)
--    case result of
--        Left exception -> putStrLn $ "Fault: " ++ show exception
--        Right protocol -> putStrLn protocol

--
-- monads
--

import Data.Char

to_lower_case = \char -> return $ toLower char
underline_spaces = \char -> if char == ' ' then return '_' else return char
to_real_numbers = \char -> return $ digitToInt char

main :: IO ()
main = 
	--print $ name >>= to_lower_case >>= underline_spaces
	--where name = "Lorem ipsuM"
	--
	--print $ name >>= to_lower_case
	--where name = Just 'A'
	--
	print $ numbers >>= to_real_numbers
	where numbers = "1234567890"