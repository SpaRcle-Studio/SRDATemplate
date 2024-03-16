//
// Created by innerviewer on 2024-03-14.
//

#include <Utils/Debug.h>
#include <Utils/Platform/Platform.h>
#include <Utils/Types/Thread.h>
#include <Utils/Locale/Encoding.h>

int main(int argc, char *argv[]) {
    auto&& applicationPath = SR_PLATFORM_NS::GetApplicationPath().GetFolder();

    SR_UTILS_NS::Debug::Instance().Init(applicationPath, true, SR_UTILS_NS::Debug::Theme::Dark);
    SR_HTYPES_NS::Thread::Factory::Instance().SetMainThread();

    SR_UTILS_NS::Locale::SetLocale();

    SR_LOG("Starting application...");

    SR_LOG("Exiting application...");
    SR_UTILS_NS::GetSingletonManager()->DestroyAll();
    return 0;
}