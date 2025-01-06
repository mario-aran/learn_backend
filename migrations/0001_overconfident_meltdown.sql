ALTER TABLE "users_to_user_roles" DISABLE ROW LEVEL SECURITY;--> statement-breakpoint
DROP TABLE "users_to_user_roles" CASCADE;--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "user_role_id" integer NOT NULL;--> statement-breakpoint
ALTER TABLE "users" ADD CONSTRAINT "users_user_role_id_user_roles_id_fk" FOREIGN KEY ("user_role_id") REFERENCES "public"."user_roles"("id") ON DELETE no action ON UPDATE no action;