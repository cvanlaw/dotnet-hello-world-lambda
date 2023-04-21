FROM mcr.microsoft.com/dotnet/sdk:7.0-bullseye-slim as build
WORKDIR /src
COPY VanLaw.Dev.DotNetHelloWorldLambda.csproj .
RUN dotnet restore "VanLaw.Dev.DotNetHelloWorldLambda.csproj"

COPY . .
RUN dotnet build "VanLaw.Dev.DotNetHelloWorldLambda.csproj" --configuration Release --output /app/build

FROM build AS publish
RUN dotnet publish "VanLaw.Dev.DotNetHelloWorldLambda.csproj" \
            --configuration Release \ 
            --runtime linux-x64 \
            --self-contained false \ 
            --output /app/publish \
            -p:PublishReadyToRun=true  

FROM public.ecr.aws/lambda/dotnet:7 as runtime
#You can also pull these images from DockerHub amazon/aws-lambda-dotnet:7
  
# Copy function code
COPY --from=publish /app/publish ${LAMBDA_TASK_ROOT}
  
# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "VanLaw.Dev.DotNetHelloWorldLambda::VanLaw.Dev.DotNetHelloWorldLambda.Function::FunctionHandler" ]