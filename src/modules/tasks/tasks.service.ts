import { Injectable, NotFoundException } from "@nestjs/common";
import { createTaskDto } from "./dto/create-task.dto.js";
import { PrismaService } from "../../prisma/prisma.service.js";
import { ListeTaskQueryDto } from "./dto/list-task.dto.js";
import { UpdateTaskDto } from "./dto/update-task.dto.js";

@Injectable()
export class tasksService {
    constructor (private readonly prisma:PrismaService){}

    create (userId: string, dto: createTaskDto){
        return this.prisma.task.create({data: {...dto, userId}})
    }

    findAll(userId: string, filter:ListeTaskQueryDto){
        return this.prisma.task.findMany({
            where:{userId,...filter},
            orderBy:{createdAt:'desc'}
        })
    }

    async findOne(userId: string, id: string){
        const task = await this.prisma.task.findFirst({
            where:{id,userId}
        });
        if (!task) throw new NotFoundException (`la tache ${id} n'existe pas`);
        return task
    }

    async update (userId:string, id:string, dto:UpdateTaskDto){
        await this.findOne(userId, id);
        return this.prisma.task.update({
            where:{id},
            data:{completed:true},
        });
    }

    async remove(userId:string, id:string){
        await this.findOne(userId, id);
        return this.prisma.task.delete({
            where:{id},
        });
    }



}

