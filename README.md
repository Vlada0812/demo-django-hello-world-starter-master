# Simple Secured Django Hello World Starter Template 

The application contains three images:
1. Django web service taken from Copyright (c) 2020 LondonAppDeveloper.
2. Proxy - nginx (for scalability)
3. Database - Postgresql



## Usage

 1. If needed install docker-compose
 2. Run 'docker-compose -f docker-compose.yml up --build'
 3. Navigate to [http://127.0.0.1:8080](http://127.0.0.1:8080) to test
 4. For using Domain name add to file /etc/hosts "127.0.0.1 testapp.com" and "127.0.0.1 www.testapp.com"
 5. Then type in the browser "testapp.com:8080"

##Security measures

The project includes security measures listed below:
1. No root user - all dockerfiles specifie non-priveleged user to run the container as well as permissions of read-only to other users.
2. No secrets hardcoded in any files.
3. All dependecies for the build are immediatly deleted after the installation, in order to minimize the security risks inside the container.
4. CPU and memory capacities usage limited for all containers.
5. Seccomp is acctivated in order to limit the permissions for different system calls from the container to the OS."Security-policy.json" - explicitly defines the additional to the default restricted actions like: mkdir and chown.
6. SAST - The code is analyzed by static code scanning tools:
  6.1 CodeQL -in python mode
  6.2 Anchore -specialized in container vullnerabilities
  6.3 The project also integrated with Snyk.

 
