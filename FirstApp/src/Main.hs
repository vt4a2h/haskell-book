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

import Data.String.Utils

ends_with :: String -> String -> Bool
ends_with str suffix = endswith suffix str

check_googler_by :: String -> String
check_googler_by email = 
	if email `ends_with` "gmail.com"
	then name_from email ++ " is a Googler!"
	else email
	where name_from = \full_email -> takeWhile (/= '@') full_email

main = print [check_googler_by email | email <- ["adam@gmail.com",
                                                 "bob@gmail.com",
                                                 "richard@gmail.com",
                                                 "elena@yandex.ru",
                                                 "denis@gmail.com"]]