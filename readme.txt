################################################################
Thunder Audit - Auditoria de dados
################################################################

Configuração
================================================================
Após a instalação é necessário copiar as linhas abaixo e colar dentro do nó do xml ontem sua sessionfactory está configurada.

<session-factory>
	...
	<mapping assembly="Thunder.Audit" />
	<listener type="pre-update" class="Thunder.Audit.EventListener, Thunder.Audit"/>
	<listener type="post-insert" class="Thunder.Audit.EventListener, Thunder.Audit"/>
	<listener type="pre-delete" class="Thunder.Audit.EventListener, Thunder.Audit"/>
</session-factory>

Implementação
================================================================
A implementação é bem simples, basta adicionar a interface IAuditable na classe que deseja auditar que automaticamente será gravado os logs de inclusão, atualização e exclusão.

Caso deseje customizar a mensagem ou informar o usuário que disparou um evento de inclusão, atualização e exclusão, basta definir o valor desejado da propriedade AuditUser para usuário e AuditDescription para a descrição da classe que a interface IAuditable foi implementada.

Scripts de banco de dados
================================================================
Localize a pasta Thunder.Audit.X.X.X dentro da pasta package do seu projeto, nesta pasta abra a pasta scripts e nela estará os scripts para Mysql e MS SQL.
