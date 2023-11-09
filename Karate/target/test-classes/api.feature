
Feature: Testing Reqres Endpoints

Scenario: Get list of users 
 Given url 'https://reqres.in/api/users'
When method GET
Then status 200

Scenario: Create a new user
Given url 'https://reqres.in/api/users'
And request "name": "morpheus", "job": "engineer"}
When method POST
Then status 201
And match responce.data.name == 'morpheus'
And match responce.data.job == 'engineer'


Scenario: Get single user details 
Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200



Scenario: Get user details-user not found
Given url 'https://reqres.in/api/unknown/'
And path '30'
When method GET
Then status 404

Scenario: Get user print the response
Given url 'https://reqres.in/api/unknown/'
And path '2'
When method GET
Then status 200

Scenario: Update user details
Given url 'https://reqres.in/api/users/2'
And request {"name": "Allen"}
When method PUT
Then status 200
* print responce
* def name = responce.data.name
* print name

Scenario: Get user details and print the name using json
Given url 'https://reqres.in/api/unknown/'
And path '1'
When method GET
Then status 200
* print response
* def jsonResponse = response
* def actualName = jsonResponse.data.name
* print actualName

Scenario: Get user details and verify user email using json path
Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200
* print response
* def jsonResponse = response
* def email = jsonResponse.data.email
* print email
* match email == 'janet.weaver@reqres.in'

Scenario: Get user details and verify.If response is invalid get-Accepted is not equal
Given url 'https://reqres.in/api/users/2'
When method GET
* print response
* def jsonResponse = response
* def name = jsonResponse.data.first_name
* print name
* match name == 'Ishwar'
Then status 203