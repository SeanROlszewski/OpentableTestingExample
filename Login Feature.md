# Feature List
## A user should be able to login
As Opentable, I want the user to be able to login so they're able to make reservations at a restaurant.

### Acceptance Criteria (or, how you know you're finished)
> **Given** I am on the account opening screen
>
> **AND**
>
> I have entered my email address and password
>
> **When** I press the submit button
>
> **Then** I'm logged in using my credentials.

### Notes
#### Implementation Suggestions
You should create a new function, class, or struct which contains this code, and test it in isolation before adding it to the `LoginViewController`. This lets you prove that the code you're writing works independently of it being inside of a view controller, and also lets you avoid the pitfalls of trying to get a view controller into an automated test (it's a surprising challenge!)

A challenge in this feature is the fact that you need to write code that needs to wait on a response. Anytime you make a network call to a server, it will take a different amount of time, and will never be be immediate. As a consequence of this, code waiting on a network response must have a way of being notified that the server responded. This is true for your app code as well as your test code.

An additional challenge presented by this feature is the fact that your network call can fail for reasons outside of your control. This poses a testing problem because we want our tests to be reliable, and forces out of our control will make our tests unreliable.

The way to solve these problems is by the usage of a **[callback](https://www.andrewcbancroft.com/2016/02/15/fundamentals-of-callbacks-for-swift-developers/)**.

Once you've gotten the network logic working, you'll need to add the functionality to the `LoginViewController`. Some boilerplate has been set up for you to make it easy to test your view controller - check out the `LoginViewControllerTests` file.

You'll get comfortable with **[XCTestExpectation](https://developer.apple.com/documentation/xctest/asynchronous_tests_and_expectations/testing_asynchronous_operations_with_expectations)** to  test the network logic you'll write to integrate with the server. Use an `XCTestExpectation` to ensure that the tests you're writing waits for the server to respond. The tests that you write should capture all the states that are possible:

* The server responded with a successful status code (200 - 299)
* The server responded with a failure status code (400 - 499)

Once you've created a network client and gotten it working, you can then add it to the `LoginViewController`. In order to test that the  `LoginViewController` uses the network client correctly, you'll need to create a **[test double](http://engineering.pivotal.io/post/the-test-double-rule-of-thumb/)**. A test double is a stand-in for a component in your code that you're substituting for the purposes of testing. The way we achieve this in Swift is by the usage of a protocol.

#### Technical Information
The purpose of this feature is to practice writing a test that validates code which is **[asynchronous](https://stackoverflow.com/a/26804844)**, and to also practice writing a test that deals with **[nondeterministic behavior](https://en.wikipedia.org/wiki/Nondeterministic_algorithm)**. This is an introduction to an **integration test**, or a test which proves a test subject (app, network layer, etc.) works with some other app, server, or system. You may notice that this is intended to test the interactions between two complex components - our iOS app and the server that backs it.

An advantage of this testing pattern is the fact that it proves your code works by communicating with a separate program, or part of the program. An integration test that passes means that two programs are communicating correctly with one another, so if your program was to be used by someone else, you would know that it would work with the other program integration tested.

<!-- A disadvantage of this testing pattern is the fact that it relies on a function returning something. It's possible for a function to cause a **[side-effect](https://softwareengineering.stackexchange.com/questions/40297/what-is-a-side-effect)**, which by definition, would be a change that's not going to be returned by the function you're testing. We often build systems that are very driven by side-effect, which prevents us from using this testing pattern often. As a consequence of this, we use other testing patterns to validate code that causes side-effects, and use blackbox testing for code that doesn't cause side-effects. -->

In addition to introducing you to integration tests, this feature will also introduce you to **collaboration tests**, which is a test pattern that proves two or more components (think classes or structs in your code) work together in a predictable way. The value in this test pattern is best demonstrated by the example of eating to test  one component, like a view controller, uses another nondeterministic component, like an http client, effectively. A collaboration test uses a **test double** as a substitute for the nondeterministic component. In doing this, you prevent the test for your view controller from failing unpredictably, as you substituted the component which would cause it to randomly fail.
