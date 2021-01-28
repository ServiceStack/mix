defmodule MyApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_app,
      version: "0.1.0",
      deps: deps()
    ]
  end

  defp deps do
    [
      {:gistcafe, "~> 0.1.0"},
      {:httpoison, "~> 1.8"},
    ]
  end
end
