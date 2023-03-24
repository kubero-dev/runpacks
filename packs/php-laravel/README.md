Overriding defaults changed from thecodingmachine image. This might be obselete after the base Image has implementen a dynamic configuration.

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ABSOLUTE_APACHE_DOCUMENT_ROOT` | `/app/public` | The Apache root directory |
| `PORT` | `8080` | The non encrypted port used on Kubernetes |
| `PORT_HTTPS` | `8443` | The encrypted port (not required) |

More Information about the codingmachine imge : https://thecodingmachine.io/building_the_ultimate_general_purpose_php_docker_image