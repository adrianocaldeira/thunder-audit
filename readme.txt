################################################################
Thunder Audit - Auditoria de dados
################################################################

Configura��o
================================================================
Ap�s a instala��o � necess�rio copiar as linhas abaixo e colar dentro do n� do xml ontem sua sessionfactory est� configurada.

<session-factory>
	...
	<mapping assembly="Thunder.Audit" />
	<listener type="pre-update" class="Thunder.Audit.EventListener, Thunder.Audit"/>
	<listener type="post-insert" class="Thunder.Audit.EventListener, Thunder.Audit"/>
	<listener type="pre-delete" class="Thunder.Audit.EventListener, Thunder.Audit"/>
</session-factory>

Implementa��o
================================================================
A implementa��o � bem simples, basta adicionar a interface IAuditable na classe que deseja auditar que automaticamente ser� gravado os logs de inclus�o, atualiza��o e exclus�o.

Caso deseje customizar a mensagem ou informar o usu�rio que disparou um evento de inclus�o, atualiza��o e exclus�o, basta definir o valor desejado da propriedade AuditUser para usu�rio e AuditDescription para a descri��o da classe que a interface IAuditable foi implementada.

Scripts de banco de dados
================================================================
Localize a pasta Thunder.Audit.X.X.X dentro da pasta package do seu projeto, nesta pasta abra a pasta scripts e nela estar� os scripts para Mysql e MS SQL.
