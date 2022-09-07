Defaults changed from thecodingmachine image: 

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `APACHE_RUN_USER` | `www-data` | The user to run Apache |
| `APACHE_RUN_GROUP` | `www-data` | The group to run Apache |
| `KUBERO_DOCUMENT_ROOT` | `/app/public` | The Apache root directory |
| `APACHE_PORT` | `www-data` | The non encrypted port used on Kubernetes |
| `APACHE_SSL_PORT` | `www-data` | The encrypted port (not required) |

More Information about the codingmachine imge : https://thecodingmachine.io/building_the_ultimate_general_purpose_php_docker_image