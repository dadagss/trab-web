#aqui eu estou importante a ngxin alpine para carregar um site leve
FROM nginx:alpine


# Copiar o conteúdo da pasta 'site' para o diretório padrão do NGINX
COPY site /usr/share/nginx/html

#aqui ele copia as configurações que fiz para que ele abra o arquivo paginainicial.html 
COPY default.conf /etc/nginx/conf.d/default.conf

#abro o conteiner na porta 80
EXPOSE 80

#este comando manda o nginx rodar em primeiro plano
CMD ["nginx", "-g", "daemon off;"]
