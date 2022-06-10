# Butler Push

This action pushes packages to itch.io with butler to easily automate releases.

## Usage

This action will call `butler push` with parameters configured by environment variables.

Example:

```yaml
steps:
- uses: manleydev/butler-publish-itchio-action@master
  env:
    BUTLER_CREDENTIALS: ${{ secrets.BUTLER_CREDENTIALS }}
    CHANNEL: windows
    ITCH_GAME: example-project
    ITCH_USER: username
    PACKAGE: build/windows
```

### Environment Variables

- #### BUTLER_CREDENTIALS **REQUIRED**

  The key used by butler to authenticate.

  **How to get credentials**

  To get your Butler credentials, you can follow the [CI Builds Credentials documentation on Itch.io](https://itch.io/docs/butler/login.html#running-butler-from-ci-builds-travis-ci-gitlab-ci-etc)

- #### CHANNEL **REQUIRED**

  The itch.io channel to push to. This would be the platform and artifact you would like to use.

  Some examples would be:

  - windows
  - linux
  - osx

  You can read more about channel names [here: https://itch.io/docs/butler/pushing.html#channel-names](https://itch.io/docs/butler/pushing.html#channel-names)

- #### ITCH_GAME **REQUIRED**

  The logical name the game you want to push to.

  Eg. If your URL is `https://username.itch.io/example-project`, your value for `ITCH_GAME` would be `example-project`.

- #### ITCH_USER **REQUIRED**

  The username of the owner of the game you are pushing to.

- #### PACKAGE **REQUIRED**

  The directory or file to push to Itch.io

- #### VERSION

  The version of your project to have in your release.

  *Note:* If both `VERSION` and `VERSION_FILE` are empty, versioning will be handled by Itch.io

- #### VERSION_FILE

  The file containing your version number to have in your release.

  *Note:* If both `VERSION` and `VERSION_FILE` are empty, versioning will be handled by Itch.io
