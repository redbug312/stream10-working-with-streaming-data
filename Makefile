AWS_DEFAULT_REGION ?= ???
AWS_ACCESS_KEY_ID ?= ???
AWS_SECRET_ACCESS_KEY ?= ???
AWS_SESSION_TOKEN ?= ???

AWS ?= AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) \
    AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) \
    AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
    AWS_SESSION_TOKEN=$(AWS_SESSION_TOKEN)

deploy: samconfig.toml
	$(AWS) sam deploy

samconfig.toml:
	$(AWS) sam build
	$(AWS) sam deploy --guided
