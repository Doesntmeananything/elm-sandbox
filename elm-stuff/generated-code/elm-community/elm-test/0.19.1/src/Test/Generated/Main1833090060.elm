module Test.Generated.Main1833090060 exposing (main)

import Example
import FuzzTests
import RippleCarryAdderTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "Example" [Example.guardianNames,
    Example.comparisonTests,
    Example.additionTests],     Test.describe "FuzzTests" [FuzzTests.addOneTests,
    FuzzTests.addTests],     Test.describe "RippleCarryAdderTests" [RippleCarryAdderTests.orGateTests,
    RippleCarryAdderTests.inverterTests,
    RippleCarryAdderTests.halfAdderTests,
    RippleCarryAdderTests.fullAdderTests,
    RippleCarryAdderTests.rippleCarryAdderTests,
    RippleCarryAdderTests.andGateTests] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 196090338193823, processes = 4, paths = ["/c/dev/elmsandbox/tests/FuzzTests.elm"]}