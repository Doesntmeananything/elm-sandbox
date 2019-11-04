module FuzzTests exposing (addOneTests, addTests)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Random exposing (maxInt, minInt)
import Test exposing (..)


addOneTests : Test
addOneTests =
    describe "addOne"
        [ fuzz frequencyFuzzer "adds 1 to any integer" <|
            \num ->
                addOne num |> Expect.equal (num + 1)
        ]


addOne : Int -> Int
addOne x =
    1 + x


add : Int -> Int -> Int
add x y =
    x + y


addTests : Test
addTests =
    describe "add"
        [ fuzz2 int int "adds two given integers" <|
            \num1 num2 ->
                add num1 num2
                    |> Expect.equal (num1 + num2)
        ]


frequencyFuzzer : Fuzzer Int
frequencyFuzzer =
    frequency
        [ ( 70, constant 7 )
        , ( 12, intRange 8 9 )
        , ( 6, constant 6 )
        , ( 9, intRange 2 4 )
        , ( 1, constant 5 )
        , ( 1, constant 1 )
        , ( 1, constant 10 )
        ]


flip : Bool -> Bool
flip x =
    not x


flipTests : Test
flipTests =
    describe "flip"
        [ fuzz bool "negates the given boolean value" <|
            \value ->
                flip value |> Expect.equal (not value)
        ]
