import http from 'k6/http';
import { sleep } from 'k6';

export default function () {
    http.get('https://tsv-petstorepetservice.proudpond-1b8c8cc0.eastus.azurecontainerapps.io/petstorepetservice/v2/pet/info');
    sleep(1);
}