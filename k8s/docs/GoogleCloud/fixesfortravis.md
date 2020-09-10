
  encrypting a service account file in the Travis container we created in the previous lecture.  
You may end up getting an error like this when deploying:

iv undefined
The command "openssl aes-256-cbc -K $encrypted_0c35eebf403c_key -iv $encrypted_0c35eebf403c_iv -in service-account.json.enc -out service-account.json -d" failed and exited with 1 during .

or, you may get:
repository not known to https://api.travis-ci.org

Depending on which domain your github repo was authorized, you may need to pass a specific flag to both the login and the file encryption:

travis login --com

or

travis login --org

or

travis login --pro

...

travis encrypt-file service-account.json -r USERNAME/REPO --com

or

travis encrypt-file service-account.json -r USERNAME/REPO --org

or

travis encrypt-file service-account.json -r USERNAME/REPO --pro

If you are getting the iv undefined error after a deployment, you'll need to run through the entire encryption process again, instead, following the instructions above.

Important Note: You can also get an iv undefined error if you've passed the wrong repo to the file encryption or passed a repo name with a typo in it.


## Fix For Failing Travis Builds
In the upcoming lecture we will be adding a script to our .travis.yml file. Similar to our previous projects that ran tests using Travis, we need to make sure the tests exit after running and don't cause our builds to fail.

Make sure to change this script:

script:
  - docker run USERNAME/docker-react npm test -- --coverage
To use the CI flag and remove coverage:

script:
  - docker run -e CI=true USERNAME/docker-react npm test