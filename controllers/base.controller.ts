import { Request, Response } from "express";
import BaseService from "../services/base.service";

class BaseController<T> {
  private pluralTableValName: string =
    this.service.table.toLocaleLowerCase() + "s";
  private singularTableValName: string = this.service.table.toLocaleLowerCase();

  constructor(protected service: BaseService<T>) {
    this.getAll = this.getAll.bind(this);
    this.getOne = this.getOne.bind(this);
    this.create = this.create.bind(this);
    this.update = this.update.bind(this);
    this.delete = this.delete.bind(this);
  }

  async getAll(req: Request, res: Response) {
    const rows = await this.service.findAll();

    res.json({
      status: "success",
      data: {
        [this.pluralTableValName]: rows,
      },
    });
  }

  async getOne(req: Request, res: Response) {
    const row = await this.service.findOne(req.params.id);

    res.json({
      status: "success",
      data: {
        [this.singularTableValName]: row,
      },
    });
  }

  async create(req: Request, res: Response) {
    const newRow = await this.service.create(req.body);

    res.status(201);
    res.json({
      status: "success",
      data: {
        [this.singularTableValName]: newRow,
      },
    });
  }

  async update(req: Request, res: Response) {
    const updatedRow = await this.service.update(req.params.id, req.body);

    res.json({
      status: "success",
      data: {
        [this.singularTableValName]: updatedRow,
      },
    });
  }

  async delete(req: Request, res: Response) {
    await this.service.delete(req.params.id);

    res.status(204);
    res.json({
      status: "success",
      data: null,
    });
  }
}

export default BaseController;
