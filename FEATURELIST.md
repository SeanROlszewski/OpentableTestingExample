# Feature List
## A user should only be able to login with  a nonempty email address and a long password
As an Opentable system admin, I want the app to prevent users from logging in with an empty or invalid email address or a password so users can't make preventable mistakes while logging in.

### Acceptance Criteria (or, how you know you're finished)
> Given I am on the account opening screen
>
> When I have entered an empty email address
>
> **OR**
>
> When I have entered something that doesn't match an email address
>
> **OR**
>
> When I have entered a password that is not at least 8 characters
>
> Then I'm unable to submit the account details because the submission button is disabled.

### Notes
#### Implementation Suggestions
You should create a new function, class, or struct which contains this code, and test it in isolation before adding it to the `LoginViewController`. This lets you prove that the code you're writing works independently of it being inside of a view controller, and also lets you avoid the pitfalls of trying to get a view controller into an automated test (it's a surprising challenging!)

For the validation logic that you need to write, you can assume something is an email address if it contains no spaces, and has an `@` and `.` 

There are a few ways to write this function - think simply! We're only interested in knowing if two strings are valid. Return something that tells us if the strings are good to use as account credentials.

Once you've gotten the validation logic working, you'll need to add the functionality to the `LoginViewController`. Some boilerplate has been set up for you to make it easy to test your view controller - check out the `LoginViewControllerTests` file.

You'll need to be comfortable with **[UIControlEvents](https://developer.appgitle.com/documentation/uikit/uicontrol/event)** to effectively test the validation logic inside the view controller. Use `UIControlEvents` to simulate a user entering text, and ensure that the `submitButton` on the `LoginViewController` changes from being disabled to enabled once an email and password are provided. The tests that you write should capture all the states that are possible: 

* Both fields are empty
* One field has text while the other is empty
* Both fields have text

#### Technical Information
The purpose of this feature is to practice writing code that validates the contents of a form. This is a good introduction to a **blackbox test**, or a test which proves a test subject (function, class, struct, enum, etc.) properly transforms an input to an output. You may see this test sometimes called a **functional test**, but this is a term that has other meanings outside of the technical definition of a blackbox test.

An advantage of this testing pattern is the fact that it proves your code works by only using a public interface; we specify the inputs to the function, call the function with these inputs, and then check if the function returns the outputs we expect. This is beneficial for a few reasons. First, it means this test won't need to be rewritten if we decide to change the implementation of the function. The only thing that will cause this test to be rewritten is change to the function signature. Second, this test will typically run very quickly as it's only performing a function call. And third, when this kind of test fails, it's apparent what the issue is and where to begin debugging as it's only exercising one function.

A disadvantage of this testing pattern is the fact that it relies on a function returning something. It's possible for a function to cause a **[side-effect](https://softwareengineering.stackexchange.com/questions/40297/what-is-a-side-effect)**, which by definition, would be a change that's not going to be returned by the function you're testing. We often build systems that are very driven by side-effect, which prevents us from using this testing pattern often. As a consequence of this, we use other testing patterns to validate code that causes side-effects, and use blackbox testing for code that doesn't cause side-effects.