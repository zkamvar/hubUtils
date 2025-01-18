# hubUtils in a tin

This packages hubUtils in a docker container.

## Using the Image

### On GitHub

Images on GitHub need to be run at the job level. You can use the `container`
key for this. For this container, the working directory is `/project`, so you
need to link your github workspace the working directory using the `volumes`
keyword.

```yaml
jobs:
  validate-submission:
    runs-on: ubuntu-latest
    env:
      GITHUB_PAT: ${{ secrets.GITHUB_TOKEN }}
    container:
      image: ghcr.io/hubverse-org/test-docker-hubutils:main
      ports:
        - 80
      volumes:
        - ${{ github.workspace }}:/project
```

After that, you only need 2 steps: checkout and validate:

```yaml
    steps:
      - name: Checkout Pull Request
        uses: actions/checkout@v4
      - name: Run utils
        run: |
          # R code you want to run
        shell: Rscript {0}
```

### Locally

To run locally, you can use this incantation with any command or script to run

```bash
docker run \
--platform=linux/amd64 \
--rm \
-it \
-v "/path/to/hub":"/project" \
ghcr.io/hubverse-org/test-docker-hubutils:main \
# script to run
```

