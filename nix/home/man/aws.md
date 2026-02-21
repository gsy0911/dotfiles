# AWS

## aliases

- `cred`: `cat $HOME/.aws/credentials | grep "\[" | sed -e 's/\[//g' | sed -e 's/\]//g'`
- `credp`: `set AWS_DEFAULT_PROFILE=$( cred | peco )`

# CDK

## aliases

- `cdkld`: `cdk deploy "$(cdk ls | grep $1 | peco)"`

## usage

```
# bootstrap
cdk bootstrap aws://ACCOUNT-NUMBER-1/REGION-1
```
