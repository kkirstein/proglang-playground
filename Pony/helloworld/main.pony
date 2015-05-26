// Hello World for the Pony programming language
//
// vim: sw=2 ts= et
//

actor Main
  new create(env: Env) =>
    env.out.print("Hello, world!")

