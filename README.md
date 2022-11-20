pre-commit-golang
=================

:rotating_light: Please see the project sunsetting announcement:
[Issues/98](https://github.com/dnephin/pre-commit-golang/issues/98)
:rotating_light:

----

golang hooks for http://pre-commit.com/

### Using these hooks

Add this to your `.pre-commit-config.yaml`

    - repo: https://github.com/dnephin/pre-commit-golang
      rev: master
      hooks:
        - id: go-fmt
        - id: go-vet
        - id: go-lint
        - id: go-imports
        - id: go-cyclo
          args: [-over=15]
        - id: validate-toml
        - id: no-go-testing
        - id: golangci-lint
        - id: go-critic
        - id: go-unit-tests
        - id: go-build
        - id: go-mod-tidy

### Available hooks

- `go-fmt` - Runs `gofmt`, requires golang
- `go-vet` - Runs `go vet`, requires golang
- `go-lint` - Runs `golint`, requires https://github.com/golang/lint but is unmaintained & deprecated in favour of [`golangci-lint`](https://github.com/golangci/golangci-lint)
- `go-imports` - Runs `goimports`, requires golang.org/x/tools/cmd/goimports
- `go-cyclo` - Runs `gocyclo`, require https://github.com/fzipp/gocyclo
- `validate-toml` - Runs `tomlv`, requires
   https://github.com/BurntSushi/toml/tree/master/cmd/tomlv
- `no-go-testing` - Checks that no files are using `testing.T`, if you want
  developers to use a different testing framework
- `golangci-lint` - run `golangci-lint run ./...`, requires
  [golangci-lint](https://github.com/golangci/golangci-lint)
- `go-critic` - run `gocritic check ./...`, requires [go-critic](https://github.com/go-critic/go-critic)
- `go-unit-tests` - run `go test -tags=unit -timeout 30s -short -v`
- `go-build` - run `go build`, requires golang
- `go-mod-tidy` - run `go mod tidy -v`, requires golang
- `go-mod-vendor` - run `go mod vendor`, requires golang
