-- CreateTable
CREATE TABLE "MembrosManancial" (
    "id_membro" SERIAL NOT NULL,
    "data_nascimento" TIMESTAMP(3) NOT NULL,
    "data_membresia_entrada" TIMESTAMP(3) NOT NULL,
    "data_membresia_saida" TIMESTAMP(3),

    CONSTRAINT "MembrosManancial_pkey" PRIMARY KEY ("id_membro")
);

-- CreateTable
CREATE TABLE "MembrosManancialQualificacoes" (
    "id_qualificacao" SERIAL NOT NULL,
    "nome_completo" TEXT NOT NULL,
    "profissao" TEXT NOT NULL,
    "estado_civil" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "rg" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "celular" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "id_membro" INTEGER NOT NULL,

    CONSTRAINT "MembrosManancialQualificacoes_pkey" PRIMARY KEY ("id_qualificacao")
);

-- CreateTable
CREATE TABLE "LogsAplicacoes" (
    "id_log" SERIAL NOT NULL,
    "id_correlacao" TEXT NOT NULL,
    "log_mensagens" TEXT NOT NULL,
    "log_data" TIMESTAMP(3) NOT NULL,
    "ambiente" TEXT NOT NULL,
    "aplicacao" TEXT NOT NULL,
    "log_nivel" TEXT NOT NULL,

    CONSTRAINT "LogsAplicacoes_pkey" PRIMARY KEY ("id_log")
);

-- CreateIndex
CREATE UNIQUE INDEX "MembrosManancialQualificacoes_cpf_key" ON "MembrosManancialQualificacoes"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "MembrosManancialQualificacoes_rg_key" ON "MembrosManancialQualificacoes"("rg");

-- CreateIndex
CREATE UNIQUE INDEX "MembrosManancialQualificacoes_email_key" ON "MembrosManancialQualificacoes"("email");

-- CreateIndex
CREATE UNIQUE INDEX "MembrosManancialQualificacoes_id_membro_key" ON "MembrosManancialQualificacoes"("id_membro");

-- AddForeignKey
ALTER TABLE "MembrosManancialQualificacoes" ADD CONSTRAINT "MembrosManancialQualificacoes_id_membro_fkey" FOREIGN KEY ("id_membro") REFERENCES "MembrosManancial"("id_membro") ON DELETE RESTRICT ON UPDATE CASCADE;
