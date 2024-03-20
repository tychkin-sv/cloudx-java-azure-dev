import http from 'k6/http';
import { sleep } from 'k6';

export default function () {
    http.get('https://tsv-petstoreproductservice.azurewebsites.net/petstoreorderservice/v2/store/info');
    sleep(1);
}