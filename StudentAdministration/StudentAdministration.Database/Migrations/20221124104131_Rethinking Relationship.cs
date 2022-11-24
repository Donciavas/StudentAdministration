using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StudentAdministration.Database.Migrations
{
    public partial class RethinkingRelationship : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_StudiesSubject_StudiesSubSubject_StudiesSubSubjectId",
                table: "StudiesSubject");

            migrationBuilder.DropIndex(
                name: "IX_StudiesSubject_StudiesSubSubjectId",
                table: "StudiesSubject");

            migrationBuilder.DropColumn(
                name: "StudiesSubSubjectId",
                table: "StudiesSubject");

            migrationBuilder.AddColumn<Guid>(
                name: "StudiesSubjectId",
                table: "StudiesSubSubject",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_StudiesSubSubject_StudiesSubjectId",
                table: "StudiesSubSubject",
                column: "StudiesSubjectId");

            migrationBuilder.AddForeignKey(
                name: "FK_StudiesSubSubject_StudiesSubject_StudiesSubjectId",
                table: "StudiesSubSubject",
                column: "StudiesSubjectId",
                principalTable: "StudiesSubject",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_StudiesSubSubject_StudiesSubject_StudiesSubjectId",
                table: "StudiesSubSubject");

            migrationBuilder.DropIndex(
                name: "IX_StudiesSubSubject_StudiesSubjectId",
                table: "StudiesSubSubject");

            migrationBuilder.DropColumn(
                name: "StudiesSubjectId",
                table: "StudiesSubSubject");

            migrationBuilder.AddColumn<Guid>(
                name: "StudiesSubSubjectId",
                table: "StudiesSubject",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_StudiesSubject_StudiesSubSubjectId",
                table: "StudiesSubject",
                column: "StudiesSubSubjectId");

            migrationBuilder.AddForeignKey(
                name: "FK_StudiesSubject_StudiesSubSubject_StudiesSubSubjectId",
                table: "StudiesSubject",
                column: "StudiesSubSubjectId",
                principalTable: "StudiesSubSubject",
                principalColumn: "Id");
        }
    }
}
