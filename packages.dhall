let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.8-20201021/packages.dhall sha256:55ebdbda1bd6ede4d5307fbc1ef19988c80271b4225d833c8d6fb9b6fb1aa6d8

in      upstream
    //  https://raw.githubusercontent.com/srghma/my-purescript-package-sets/4954461/packages.dhall sha256:6d7e32ad3c68e3dc06d576879bcbe641b3c6e6c8d609b0d8dad84cb286dd0abb
          upstream.(https://raw.githubusercontent.com/srghma/my-purescript-package-sets/4954461/upstreamTypeChunk.dhall sha256:a123bf398ed3e5092620d356e1fe291dd176e5f520664308f0981d3ed088af09)
