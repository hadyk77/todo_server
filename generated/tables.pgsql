--
-- Class Todo as table todo
--

CREATE TABLE "todo" (
  "id" serial,
  "title" text NOT NULL,
  "expireDate" timestamp without time zone NOT NULL,
  "createdAt" timestamp without time zone NOT NULL,
  "completed" boolean NOT NULL
);

ALTER TABLE ONLY "todo"
  ADD CONSTRAINT todo_pkey PRIMARY KEY (id);


