module Playground exposing (..)

import Html exposing (Html, text)
import Json.Decode exposing (decodeString, int)
import MyList exposing (..)
import Regex


scoreMultiplier =
    2


highestScores =
    [ 316, 320, 312, 370, 337, 318, 314 ]


doubleScores scores =
    List.map (\x -> x * scoreMultiplier) scores


escapeEarth myVelocity mySpeed fuelStatus =
    let
        escapeVelocityInKmPerSec =
            11.186

        orbitalSpeedInKmPerSec =
            7.67

        whereToLand =
            if fuelStatus == "low" then
                "Land on droneship"

            else
                "Land on launchpad"
    in
    if myVelocity > escapeVelocityInKmPerSec then
        "Godspeed"

    else if mySpeed == orbitalSpeedInKmPerSec then
        "Stay in orbit"

    else
        whereToLand


computeSpeed distance time =
    distance / time


computeTime startTime endTime =
    endTime - startTime


multiply c d =
    c * d


divide e f =
    e / f


weekday dayInNumber =
    case dayInNumber of
        0 ->
            "Sunday"

        1 ->
            "Monday"

        2 ->
            "Tuesday"

        3 ->
            "Wednesday"

        4 ->
            "Thursday"

        5 ->
            "Friday"

        6 ->
            "Saturday"

        _ ->
            "Unknown day"


hashtag dayInNumber =
    case weekday dayInNumber of
        "Sunday" ->
            "#SinDay"

        "Monday" ->
            "#MondayBlues"

        "Tuesday" ->
            "#TakeMeBackTuesday"

        "Wednesday" ->
            "#HumpDay"

        "Thursday" ->
            "#ThrowbackThursday"

        "Friday" ->
            "#FlashbackFriday"

        "Saturday" ->
            "#Caturday"

        _ ->
            "#Whatever"


revelation =
    """
    It became very clear to me sitting out there today
    that every decision I've made in my entire life has
    been wrong. My life is the complete "opposite" of
    everything I want it to be. Every instinct I have,
    in every aspect of life, be it something to wear,
    something to eat - it's all been wrong.
    """


descending a b =
    case compare a b of
        LT ->
            GT

        GT ->
            LT

        EQ ->
            EQ


evilometer character1 character2 =
    case ( character1, character2 ) of
        ( "Joffrey", "Ramsay" ) ->
            LT

        ( "Joffrey", "Night King" ) ->
            LT

        ( "Ramsay", "Joffrey" ) ->
            GT

        ( "Ramsay", "Night King" ) ->
            LT

        ( "Night King", "Joffrey" ) ->
            GT

        ( "Night King", "Ramsay" ) ->
            GT

        _ ->
            GT


validateEmail email =
    let
        emailPattern =
            "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

        regex =
            Maybe.withDefault Regex.never <|
                Regex.fromString emailPattern

        isValid =
            Regex.contains regex email
    in
    if isValid then
        ( "Valid email", "green" )

    else
        ( "Invalid email", "red" )


multiplyByFive : number -> number
multiplyByFive number =
    let
        multiplier =
            5
    in
    number * multiplier


guardiansWithShortNames : List String -> Int
guardiansWithShortNames guardians =
    guardians
        |> List.map String.length
        |> List.filter (\x -> x < 6)
        |> List.length


add : number -> number -> number
add num1 num2 =
    num1 + num2


type Greeting
    = Howdy
    | Hola
    | Namaste String
    | NumericalHi Int Int


sayHello : Greeting -> String
sayHello greeting =
    case greeting of
        Howdy ->
            "How y'all doin'?"

        Hola ->
            "Hola, amigo!"

        Namaste message ->
            message

        NumericalHi value1 value2 ->
            value1 + value2 |> String.fromInt


signUp : String -> String -> Result String String
signUp email ageStr =
    case String.toInt ageStr of
        Nothing ->
            Err "Age must be an integer."

        Just age ->
            let
                emailPattern =
                    "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

                regex =
                    Maybe.withDefault Regex.never <|
                        Regex.fromString emailPattern

                isValidEmail =
                    Regex.contains regex email
            in
            if age < 13 then
                Err "You need to be at least 13 years old to sign up."

            else if isValidEmail then
                Ok "Your account has been created successfully!"

            else
                Err "You entered an invalid email."


type alias Character =
    { name : String
    , age : Maybe Int
    }


sansa : Character
sansa =
    { name = "Sansa"
    , age = Just 19
    }


arya : Character
arya =
    { name = "Arya"
    , age = Nothing
    }


getAdultAge : Character -> Maybe Int
getAdultAge character =
    case character.age of
        Nothing ->
            Nothing

        Just age ->
            if age >= 18 then
                Just age

            else
                Nothing


list1 : MyList a
list1 =
    Empty


list2 : MyList number
list2 =
    Node 9 Empty


resultMap5Example : Result Json.Decode.Error Int
resultMap5Example =
    Result.map5 addFiveNumbers
        (decodeString int "1")
        (decodeString int "2")
        (decodeString int "3")
        (decodeString int "4")
        (decodeString int "5")


addFiveNumbers : Int -> Int -> Int -> Int -> Int -> Int
addFiveNumbers a b c d e =
    a + b + c + d + e


welcomeMessage : { a | isLoggedIn : Bool, name : String } -> String
welcomeMessage { isLoggedIn, name } =
    case isLoggedIn of
        True ->
            "Welcome, " ++ name ++ "!"

        False ->
            "Please log in."


type alias User =
    { name : String
    , email : String
    , age : Int
    , isLoggedIn : Bool
    }


main : Html msg
main =
    isEmpty list2
        |> Debug.toString
        |> text
