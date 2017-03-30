defmodule GoogleLogin.Mixfile do
  use Mix.Project

  def project do
    [app: :google_login,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:cowboy, :plug, :jwt],
    mod: {GoogleLogin, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  def deps do
    [{:cowboy, "~> 1.0.0"},
     {:jwt, git: "https://github.com/amezcua/jwt-google-tokens.git", branch: "master"},
     {:plug, "~> 1.0"}]
  end
end
