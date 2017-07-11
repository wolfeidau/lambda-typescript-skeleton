# lambda-typescript-skeleton

This skeleton contains a basic lambda function written in typescript with tests, linting and deployment configuration using SAM.

# why typescript?

Having programmed in JS for quite a few years totally over watching myself and others make the same trivial mistakes. Typescripts aproach to base the langauge on JS, then introduce a safety net of types, along with a raft other small enhancements is much appreciated. My aim is to encourage new delelopers to use Typescript and skip the relative nightmare that is JS, at least until they have the basics.

# conventions

This project uses a few conventions.

## environment

The project has a couple of parameters which are used as a label for resources created, it is composed of:

* EnvironmentName: The name or identifier used for the environment. eg dev, stage or prod
* EnvironmentNumber: This is typically a sequence number given to different sub environments.

## configuration

We typically use [Systems Manager Parameter Store](http://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-paramstore.html) as our secret and configuration storage system. To retrieve configuration items we have provisioned prior to launch of a stack we use the `EnvironmentName` and `EnvironmentNumber` to compose a key and retrieve a given setting. An example of his is seen below where the `EnvironmentName` is dev, and the `EnvironmentNumber` is one.

```
/dev/1/RDS/connection-string
```

This enables storage of any number of configuration parameters.

# prerequisites

Install NodeJS.

```
brew install node
```

Install Typescript.

```
npm install typescript -g
```

Install Typescript Lint.

```
npm install tslint
```

Install the aws CLI.

```
brew install awscli
```

**Note:** This setup assumes mac, it is just here to illustrate the requirements and give you the gist of what is needed.

# setup

This project is designed as a template for your project, just clone it then start developing in your favourite editor.

```
git clone https://github.com/wolfeidau/lambda-typescript-skeleton.git your-project-name
```

Then remove the git directory, and setup your new git project.

```
cd your-project-name
rm -rf .git
git init
git add . 
git commit -a "Initial import of skeleton project"
```

# License

This project is released under The Unlicense, your free to copy this and do what you like.