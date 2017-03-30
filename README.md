Elixir/JS Google Auth Login Example
-------------------------

An example or template to quickly bootstrap an OAuth sign-in process
with JWT and using Google as the Identity Provider. It uses the
FirebaseUI JavaScript library to handle the sign-in and uses an Elixir
plug as an authenticated custom backend server. It's easy to add
Facebook, Twitter, and Github as Identify Providers (see the link
below). You can also use email as an Identity Provider but I haven't
tried that, so I'm not sure what extra work that might entail.

This is as simple as possible to demonstrate the parts. Click the
Google badge to sign in and click the `Sign out` button to sign out.
Round trip until it makes sense. ;)

1. `git clone https://github.com/formido/google-auth-login-example.git`
2. Open the file at `priv/app.eex`, find the HTML comment labeled *TODO*,
   and follow the instructions as clarified in this
   [FirebaseUI-Web document](https://github.com/firebase/FirebaseUI-Web).
2. `cd google-auth-login-example`
3. `mix deps.get`
4. `iex -S mix`
5. Visit `localhost:4001` from a browser.
