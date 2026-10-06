import { Module } from '@nestjs/common';
import { TasksController } from './tasks.controller.js';
import { tasksService } from './tasks.service.js';

@Module({
	controllers: [TasksController],
	providers: [tasksService],
})
export class TasksModule {}
