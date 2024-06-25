import { IStudent } from "../interfaces";
import BaseService from "./base.service";

class StudentService extends BaseService<IStudent> {
  constructor(protected table: string) {
    super(table);
  }
}

export default StudentService;
