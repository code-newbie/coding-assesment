import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable, throwError} from 'rxjs';
import {Product} from '../product';
import {catchError, map, tap} from 'rxjs/operators';
import { MessageService } from './message.service';


@Injectable({
  providedIn: 'root'
})
export class DataService {
  apiurl = 'api/products';
  headers = new HttpHeaders().set('Content-Type', 'application/json').set('Accept', 'application/json');
  httpOptions = {
    headers: this.headers
  };
  constructor(private http: HttpClient, private messageService: MessageService) { }

  private handleError(error: any) {
    console.error(error);
    return throwError(error);
  }

  getProducts(): Observable<Product[]> {
    this.messageService.add('ProductService: fetched products');
    return this.http.get<Product[]>(this.apiurl).pipe(
      tap(data => console.log(data)),
      catchError(this.handleError)
    );
  }
  getProduct(id: number): Observable<Product> {
    const url = `${this.apiurl}/${id}`;
    return this.http.get<Product>(url).pipe(
      catchError(this.handleError)
    );
  }
  addProduct(product: Product): Observable<Product> {
    product.id = null;
    return this.http.post<Product>(this.apiurl, product, this.httpOptions).pipe(
      tap(data => console.log(data)),
      catchError(this.handleError)
    );
  }
  updateProduct(product: Product): Observable<any> {
    const url = `${this.apiurl}/${product.id}`;
    return this.http.put(this.apiurl, product, this.httpOptions).pipe(
      map(() => product),
      catchError(this.handleError)
    );
  }
}
