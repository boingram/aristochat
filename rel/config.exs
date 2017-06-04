# Import all plugins from `rel/plugins`
# They can then be used by adding `plugin MyPlugin` to
# either an environment, or release definition, where
# `MyPlugin` is the name of the plugin module.
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"WFV4G;(dqBx0@o]E3?]L{)&Cb//:cntaz3ax]0L7]oi&p5c.;L22E3Jlp53j:n@3"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"d28xn%y;,8i}$:@kV9t:9pj1:KO0f&2F={g__*7dW(8Z]`K%5;o?{?oIcqFU.gkf"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :aristochat do
  set version: current_version(:aristochat)
  set applications: [
    :runtime_tools
  ]
  set vm_args: "vm.args"
end

