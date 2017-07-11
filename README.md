# lambda-typescript-skeleton

This skeleton contains a basic [Amazon Web Services](https://aws.amazon.com/) (AWS) lambda function written in [Typescript](https://www.typescriptlang.org) with tests, linting and deployment configuration using AWS [Serverless Application Model](https://github.com/awslabs/serverless-application-model) (SAM).

# why Typescript?

Having programmed in Javascript for quite a few years I am totally over watching myself, and others make the same trivial mistakes. I want to help others avoid these pitfals, hence the move to Typescript.

Typescript is mostly compatible with Javascript while introducing static types, this paired with a raft other enhancements makes the language safer, more robust and in my view better for beginners.

The aim of this project is provide a skeleton enabling developers to try Typescript in Lambda Functions.

# conventions

This project uses a couple of conventions which simplify running parralel environments and configuration.

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

# usage

Clone the lambda function, in this example we are just cloning the skeleton.

```
git clone https://github.com/wolfeidau/lambda-typescript-skeleton.git
```

Run the tests.

```
make test
```

Deploy the skeleton, this will use the `BUCKET` to stage the handler.zip file, prior to deployment with [SAM](https://github.com/awslabs/serverless-application-model).

```
AWS_PROFILE=myawsprofile AWS_REGION=us-west-2 BUCKET=somebucket.example.com make deploy
```

**Note:** The `Makefile` has been built to enable reproducable builds, this should mean deployments only happen when the code or dependencies are updated.

# License

This project is released under The Unlicense, your free to copy this and do what you like.