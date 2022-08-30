# Transform statements from Romanian banks to OFX using Docker

Supported sources:

- `ING` - CSV files
- `Revolut` - Revolut's CSV files

## Contributions are welcomed for other banks!

## Usage

The examples will mount your current working directory into the container as a bind volume. You should have a `statement.csv` in this directory.

### Example for ING
```
docker run -v $PWD:/data ssipos/ofxstatement-ro ofxstatement convert -t ingro /data/ing.csv /data/ing.ofx
```

### Example for Revolut
```
 docker run -v $PWD:/data ssipos/ofxstatement-ro ofxstatement convert -t revolut /data/revolut.csv /data/revolut.ofx
 ```

## Publishing a new release
1. Create a new release
2. Build new Docker images
3. Log into Dockerhub via docker cli
4. Push latest tagged builds up to Dockerhub
