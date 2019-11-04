module Test.Generated.Main4166586260 exposing (main)

import Example
import RippleCarryAdderTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "Example" [Example.guardianNames,
    Example.comparisonTests,
    Example.additionTests],     Test.describe "RippleCarryAdderTests" [RippleCarryAdderTests.orGateTests,
    RippleCarryAdderTests.inverterTests,
    RippleCarryAdderTests.halfAdderTests,
    RippleCarryAdderTests.andGateTests] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 334027681948036, processes = 4, paths = ["/c/dev/elmsandbox/tests/RippleCarryAdderTests.elm"]}