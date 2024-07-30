import axios, { type AxiosInstance } from 'axios';

export class HTTPClient {
  protected http: AxiosInstance;

  constructor(private path: string) {
    this.http = axios.create({
      baseURL: import.meta.env.VITE_NEST_BACKEND + this.path,
    });
  }
}
