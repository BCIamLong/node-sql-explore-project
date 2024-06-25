import { IStudent } from "../interfaces";
import BaseService from "../services/base.service";
import BaseController from "./base.controller";

class StudentController extends BaseController<IStudent> {
  constructor(protected service: BaseService<IStudent>) {
    super(service);
  }
}

export default StudentController;
